export let state = 'prod'
export const PORT = 3001
export const END_POINT_MAIL = state === "dev" ? `http://localhost:3000` : `https://api.outwittrader.com`
export const WEBHOOK_DISCORD = "https://discord.com/api/webhooks/1345655145404305541/tBd0s8WZyx_DeDwuxzLClvGesMr3AnaShFuh8ErX8A38LQhBv1AxQZi9N9PWkmuIPbQO"