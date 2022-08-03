const cheerio = require('cheerio')
const axios = require('axios')
const fs = require('fs')

const url = 'https://www.jamesqquick.com/talks'

const all_talks = []
const getTalks = (url) => {
  axios.get(url).then(res => {
    const $ = cheerio.load(res.data)

    $('.card').each(function() {
      image = $(this).find('div > div > img').attr('src')
      title = $(this).find('.card--title').text()
      description = $(this).find('.card--description').text()
      date = $(this).find('.card--date').text()
      all_talks.push({image, title, description, date})
    })

    console.log(all_talks)
  })
}

getTalks(url)