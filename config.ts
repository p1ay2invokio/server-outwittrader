type stateType = "dev" | "prod"

export const state: stateType = "dev"
export const PORT = 3001
export const END_POINT_MAIL = state == "dev" ? `http://localhost:3000` : `https://outapi.outwittrader.com`