import express, { Request, Response } from 'express'
import nodemailer from 'nodemailer'
import { END_POINT_MAIL } from '../config'


const router = express.Router()


router.post("/email", async (req: Request, res: Response) => {

    const { email_rec } = req.body

    console.log(email_rec)

    var transporter = nodemailer.createTransport({
        host: 'smtp.gmail.com',
        secure: true,
        port: 465,
        auth: {
            user: 'play21947@gmail.com',
            pass: 'ghph chbp sgpj mlvm'
        },
    });

    var mailOptions = {
        from: 'play2Store@gmail.com',
        to: email_rec,
        subject: 'OutwitTrader Reset Password',
        text: `${END_POINT_MAIL}/change_password/${email_rec}`,
    };

    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            console.log(error);
            res.status(400).send("ERR")
        } else {
            // console.log('Email sent: ' + info.response);
            res.status(200).send({ send_success: true })
        }
    });
})

export default router