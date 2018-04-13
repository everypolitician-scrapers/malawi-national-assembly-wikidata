#!/bin/env ruby
# frozen_string_literal: true

require 'wikidata/fetcher'
require 'pry'

names = EveryPolitician::Wikidata.wikipedia_xpath(
  url:   'https://en.wikipedia.org/wiki/List_of_current_members_of_the_National_Assembly_of_Malawi',
  xpath: '//table[tr[th[.="Party"]]]//td[1]//a[not(@class="new")]/@title'
)

sparq = 'SELECT DISTINCT ?item WHERE { ?item p:P39 [ ps:P39 wd:Q21295990 ; pq:P2937 wd:Q45767574 ] }'
ids = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { en: names })
