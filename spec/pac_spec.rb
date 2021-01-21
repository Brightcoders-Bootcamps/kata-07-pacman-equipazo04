require_relative '../app/pac'

describe Pac do
    pacman = Pac.new(5,5)

    it 'default position' do
        expect(pacman.posi_x).to be(5)
        expect(pacman.posi_y).to be(5)
    end
end