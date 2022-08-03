const puppeteer = require("puppeteer")

const getMovies = async() => {
  const browser = await puppeteer.launch()
  const page = await browser.newPage()

  await page.goto("https://www.imdb.com/what-to-watch/fan-favorites/?ref_=hm_fanfav_sm", {waitUntil: 'networkidle2'})
  const ratings = await page.$$('.ipc-poster-card__rating-star-group .ipc-rating-star')
  const title = await page.$$('.ipc-poster-card__title--clickable')
  
  for (const item of ratings) {
    const result = await page.evaluate(el => el.innerText, item)
    console.log(result)
  }
  console.log('------------------------------------------')
  for (const item of title) {
    const result = await page.evaluate(el => el.innerText, item)
    console.log(result)
  }
  
  await browser.close()
}
getMovies()