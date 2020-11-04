require 'trello'
require 'pry'

def puts_todos
  configure
  get_cards

  puts '-------------------------------'
  puts '【TODO】'
  cards.each do |card|
    puts card.name
  end
  puts '-------------------------------'
end

def configure
  Trello.configure do |config|
    config.developer_public_key = 'API認証キー'
    config.member_token = 'トークン認証'
  end
end

def get_cards
  member = Trello::Member.find('ユーザーID')
  boards = member.boards
  board = boards.find { |board| board.name == 'TODO' }
  lists = board.lists[0]
  cards = list.cards
end

puts_todos