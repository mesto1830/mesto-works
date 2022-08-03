const puppeteer = require("puppeteer")

const getProducts = async() => {
  try {
    const browser = await puppeteer.launch()
    const page = await browser.newPage()
  
    await page.goto("https://www.amazon.com/s?i=specialty-aps&bbn=16225007011&rh=n%3A16225007011%2Cn%3A13896617011&ref=nav_em__nav_desktop_sa_intl_computers_tablets_0_2_6_4", {waitUntil: 'networkidle2'})
  
    const main = await page.$$('.s-card-container')
    for (const item of main) {
       //get all
      // const getAll = await page.evaluate(el => el.innerText, item)
      // console.log(getAll)
  
      //get items
      const poster = await page.evaluate(el => el.querySelector('.s-image').getAttribute('src'), item)
      const links = await page.evaluate(el => el.querySelector('.a-link-normal').getAttribute('href'), item)
      const rating = await page.evaluate(el => el.querySelector('.a-size-base').innerText, item)
      const price = await page.evaluate(el => el.querySelector('.a-price > .a-offscreen').innerText, item)

      const products = [
        {poster: poster},
        {links: links},
        {rating: rating},
        {price: price}
      ]
      console.log(products)
      
      await browser.close()
    }
  } catch (error) {
    console.error(error)
  }
  
}
getProducts()