import cors from 'cors'
import express from 'express'
import { PORT, state } from './config'
import UserRoute from './routes/user.route'
import ProductRoute from './routes/product.route'
import OrderRoute from './routes/order.route'
import MailRoute from './routes/mail.route'
import ForexRouter from './routes/forex.route'
import TeamRouter from './routes/team.route'
import crypto from 'crypto'
import axios from 'axios'
import dayjs from 'dayjs'
import { AppDataSource } from './AppDataSource'
import { UserEntity } from './entities/user.entity'
// import ioredis from 'ioredis'


const formatMemoryUsage = (data: any) => `${Math.round(data / 1024 / 1024 * 100) / 100} MB`;

const memoryData = process.memoryUsage();

const memoryUsage = {
    rss: `${formatMemoryUsage(memoryData.rss)} -> Resident Set Size - total memory allocated for the process execution`,
    heapTotal: `${formatMemoryUsage(memoryData.heapTotal)} -> total size of the allocated heap`,
    heapUsed: `${formatMemoryUsage(memoryData.heapUsed)} -> actual memory used during the execution`,
    external: `${formatMemoryUsage(memoryData.external)} -> V8 external memory`,
};

console.log(memoryUsage);

// export const redis = new ioredis({
//     host: state == 'dev' ? 'localhost' : 'redis',
//     port: 6379
// })

// redis.set('key', 'Hello Redis', (err, reply) => {
//     if (err) throw err

//     console.log(reply)

//     redis.get('key', (err, value) => {
//         if (err) throw err

//         console.log("Get : ", value)
//     })
// })

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

const BBB_URL = 'https://oslive.outwittrader.com/bigbluebutton';
const BBB_SECRET = 'ZcmBa8T1rq0AruaPJFnEaL28dZERWM0AYxgVGRbH'

function generateChecksum(apiCall: string, query: string) {
    return crypto.createHash('sha1').update(apiCall + query + BBB_SECRET).digest('hex');
}

app.post('/api/meetings/create', async (req, res) => {
    let { room_name } = req.body

    console.log(room_name)

    const meetingID = room_name
    const query = `meetingID=${meetingID}&name=${meetingID}&welcome=Welcome&bannerText=OutwitStreaming&endWhenNoModerator=false&endWhenNoModeratorDelayInMinutes=999999&duration=999999&allowRequestsWithoutSession=true&muteOnStart=true&lockSettingsDisableCam=true&lockSettingsDisableMic=true&lockSettingsDisablePublicChat=true&meetingLayout=FOCUS_ON_PRESENTATION`;
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
app.use('/api', UserRoute, ProductRoute, OrderRoute, MailRoute, ForexRouter, TeamRouter)

app.listen(PORT, '0.0.0.0', () => {
    console.log(`server is running on port ${PORT}`)
})