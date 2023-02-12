import { disconnect } from "process"

export function dayRate(ratePerHour) {
  return ratePerHour * 8
}
export function daysInBudget(budget, ratePerHour) {
  return Math.floor(budget / dayRate(ratePerHour))
}
export function priceWithMonthlyDiscount(ratePerHour, numDays, discount) {
  return (dayRate(ratePerHour) * numDays) - (dayRate(ratePerHour) * numDays * discount)
}
