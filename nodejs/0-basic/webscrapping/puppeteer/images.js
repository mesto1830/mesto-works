const puppeteer = require("puppeteer")
const fs = require("fs/promises")

async function start() {
  const browser = await puppeteer.launch()
  const page = await browser.newPage()
  await page.goto("https://learnwebcode.github.io/practice-requests/")

  const photos = await page.$$eval("img", imgs => {
    return imgs.map(item => item.src)
  })

  for (const photo of photos) {
    const imagepage = await page.goto(photo)
    await fs.writeFile(photo.split("/").pop(), await imagepage.buffer())
  }

  await browser.close()
}

start()