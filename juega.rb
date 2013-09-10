#!/usr/bin/env ruby

require 'bundler'
Bundler.require

NOTE_MAP = {
  0 => ' ',
  1 => 'a',
  2 => 'b',
  3 => 'c',
  4 => 'd',
  5 => 'e',
  6 => 'f',
  7 => 'g'
}

bleep = Bloops.new
bleep.tempo = 120
instrument = bleep.sound Bloops::SINE

File.open ARGV[0] do |handle|
  handle.gets # skip header
  handle.each do |line|
    counts = line.strip.split(',')[1..-1].map(&:to_i)

    song = counts.map { |x| NOTE_MAP[x] }.join(' ')

    bleep.tune instrument, song
    bleep.play

    print line

    sleep 1 while !bleep.stopped?
  end
end
