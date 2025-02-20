import { NextFunction, Request, Response } from "express"
import jwt from 'jsonwebtoken'


interface TokenInterface extends Request {
    id?: number
}

export const TokenMiddleware = (req: TokenInterface, res: Response, next: NextFunction) => {

    let token = req.headers.authorization?.split(' ')[1]

    if (token) {
        try{
            let decode = jwt.verify(token, "play2") as TokenInterface

            if (decode) {
                req.id = decode.id
    
                next()
            }
        }catch(err){
            res.status(403).send("Invalid Token")
        }
    } else {
        res.status(401).send("Unauthorized")
    }
}