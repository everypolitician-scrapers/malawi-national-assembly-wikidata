#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'
require 'pry'

names = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://en.wikipedia.org/wiki/List_of_current_members_of_the_National_Assembly_of_Malawi',
  xpath: '//table[tr[th[.="Party"]]]//td[1]//a[not(@class="new")]/@title',
)

EveryPolitician::Wikidata.scrape_wikidata(names: { en: names })
