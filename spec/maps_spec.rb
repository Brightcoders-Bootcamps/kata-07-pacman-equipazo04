require_relative '../app/maps'

describe Maps do
    maps = Maps.new(11,11)

    it 'print the board' do
        expect(maps.width).to be(11)
        expect(maps.height).to be(11)
    end

end