#!/bin/env ruby
# frozen_string_literal: true

require 'wikidata/fetcher'
require 'pry'

sparq = 'SELECT DISTINCT ?item WHERE { ?item p:P39 [ ps:P39 wd:Q21295990 ; pq:P2937 wd:Q45767574 ] }'
ids = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: ids)
