export let state = 'prod'
export const PORT = 3001
export const END_POINT_MAIL = state === "dev" ? `http://localhost:3000` : `https://apis.outwittrader.com`
export const DISCORD_ACTIVE = true
export const WEBHOOK_DISCORD:any = process.env.DISCORD_WEBHOOK