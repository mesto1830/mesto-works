const puppeteer = require("puppeteer")

const getMovies = async() => {
  const browser = await puppeteer.launch()
  const page = await browser.newPage()

  await page.goto("https://www.imdb.com/what-to-watch/fan-favorites/?ref_=hm_fanfav_sm", {waitUntil: 'networkidle2'})

  const main = await page.$$('.ipc-poster-card')
  console.log(main)
  for (const item of main) {
     //get all
    // const movies = await page.evaluate(el => el.innerText, item)

    //get items
    const poster = await page.evaluate(el => el.querySelector('.ipc-image').getAttribute('src'), item)
    const links = await page.evaluate(el => el.querySelector('.ipc-lockup-overlay').getAttribute('href'), item)
    const rating = await page.evaluate(el => el.querySelector('.ipc-rating-star').innerText, item)
    const title = await page.evaluate(el => el.querySelector('.ipc-poster-card__title--clickable').innerText, item)
    movies = [
      {poster:poster},
      {links:links},
      {rating:rating},
      {title:title}
    ]
    console.log(movies)
  }
  
  await browser.close()
}
getMovies()