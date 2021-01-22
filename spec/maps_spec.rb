# frozen_string_literal: true

require_relative '../app/maps'

describe Maps do
  maps = Maps.new(11, 11)

  it 'print the board' do
    expect(maps.width).to be(11)
    expect(maps.height).to be(11)
  end

  it 'create wall' do
    expect(maps.print_walls('|')).to be('|')
  end
end
