import cors from 'cors'
import express from 'express'
import { PORT } from './config'
import UserRoute from './routes/user.route'
import ProductRoute from './routes/product.route'
import OrderRoute from './routes/order.route'
import MailRoute from './routes/mail.route'
import crypto from 'crypto'
import axios from 'axios'
// import xml from 'xml2js'
import nodemailer from 'nodemailer'
import dayjs from 'dayjs'
import { AppDataSource } from './AppDataSource'
import { UserEntity } from './entities/user.entity'
import { Raw } from 'typeorm';

const app = express()
app.use(express.json())
app.use(cors())

// Update Every user days -1 on 00.00

const updateTotalDays = async () => {
    console.log("It's midnight! Updating total_days...");

    await AppDataSource.createQueryBuilder()
        .update(UserEntity)
        .set({ total_days: () => "total_days - 1" })
        .where("total_days > 0")
        .execute();

    scheduleMidnightTask();
};

const scheduleMidnightTask = () => {
    const now = dayjs();
    const nextMidnight = now.add(1, 'day').startOf('day');
    const timeUntilMidnight = nextMidnight.diff(now)

    console.log(`Next update scheduled in ${timeUntilMidnight / 1000} seconds`);

    setTimeout(updateTotalDays, timeUntilMidnight);
};

scheduleMidnightTask();

app.get('/api/test', async (req, res) => {
    res.status(200).send({ status: true })
});

app.get('/api/row', async (req, res) => {
    await AppDataSource.createQueryBuilder()
        .update(UserEntity)
        .set({ total_days: () => "total_days - 1" })
        .where("total_days > 0")
        .execute();
    res.status(200).send({ status: true })
});

const BBB_URL = 'https://bbb.outwittrader.com/bigbluebutton';
const BBB_SECRET = 'gWaTMghSRfH5ejCCOg0NFDCp7SKVqq9Sz2e0GXcGsw'

function generateChecksum(apiCall: string, query: string) {
    return crypto.createHash('sha1').update(apiCall + query + BBB_SECRET).digest('hex');
}

app.get('/api/meetings/create', async (req, res) => {
    // const meetingID = 'meeting-' + Date.now();
    const meetingID = 'meeting-' + 'outwit-room'
    const query = `meetingID=${meetingID}&name=${meetingID}&welcome=Welcome&bannerText=OutwitStreaming&endWhenNoModerator=false&endWhenNoModeratorDelayInMinutes=999999&duration=999999&allowRequestsWithoutSession=true&muteOnStart=true&lockSettingsDisableCam=true&lockSettingsDisableMic=true`;
    const checksum = generateChecksum('create', query);
    const url = `${BBB_URL}/api/create?${query}&checksum=${checksum}`;
    const response = await axios.get<string>(url);
    res.status(200).send(response.data)
});

app.post("/api/meetings/join", async (req, res) => {
    const { meetingID, fullName, role, avatarURL } = req.body;

    console.log(meetingID)

    const query = `meetingID=${meetingID}&fullName=${fullName}&role=${role}&avatarURL=${avatarURL}`
    const checksum = generateChecksum('join', query);

    // Generate the join URL
    const url = `${BBB_URL}/api/join?${query}&checksum=${checksum}`;

    console.log(url)

    res.status(200).send(url)
})

app.post('/api/meetings/users', async (req, res) => {
    const { meetingID } = req.body
    console.log(meetingID)
    const checksum = generateChecksum('getMeetingInfo', `meetingID=${meetingID}`);
    const url = `${BBB_URL}/api/getMeetingInfo?meetingID=${meetingID}&checksum=${checksum}`;

    try {
        const response = await axios.get(url);
        res.json(response.data);
    } catch (error) {
        res.status(500).json({ error: 'Error fetching meeting info' });
    }
});


app.use('/slip', express.static('uploads'))
app.use('/api', UserRoute, ProductRoute, OrderRoute, MailRoute)

app.listen(PORT, '0.0.0.0', () => {
    console.log(`server is running on port ${PORT}`)
})