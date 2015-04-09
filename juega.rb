#!/usr/bin/env ruby

require 'bundler'
Bundler.require

NOTE_MAP = {
  'N' => ' ',
  'A' => 'a',
  'C' => 'c',
  'T' => 'e',
  'G' => 'g'
}

bleep = Bloops.new
bleep.tempo = 120
instrument = bleep.sound Bloops::SINE

File.open ARGV[0] do |handle|
  handle.gets # skip header
  # binding.pry
  handle.each do |line|
    counts = line.strip.split('')

    song = counts.map { |x| NOTE_MAP[x] }.join(' ')

    bleep.tune instrument, song
    bleep.play

    print line

    sleep 1 while !bleep.stopped?
  end
end
