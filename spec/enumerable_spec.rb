describe 'enumerable methods' do
  it 'returns true if block never returns false or nil' do
    array1 = [nil, 99, 78, true]
    expect(array1.all?).to eq false
    expect(%w[bat, bird, big].all? { |word| word[0] == 'b' }).to eq true
  end

  it 'returns true if block ever returns a value other than false or nil' do
    array1 = [nil, 99, 78, true]
    array2 = [false, nil]
    expect(array1.any?).to eq true
    expect(%w[bat, bird, big].any? { |word| word[0] == 'b' }).to eq true
    expect(array2.any?).to eq false
  end

  it 'returns the number of items enumerated over' do
    array1 = [nil, 99, 78, true]
    expect(array1.count).to eq 4
  end

  it 'enumerates over a block and returns that block repeated x times, or forever if none or nil is given' do
    letters = ['a', 'b', 'c']
    full_letter = []
    letters.cycle(2) { |letter| full_letter << letter}
    expect(full_letter).to eq ['a', 'b', 'c','a', 'b', 'c']
  end

  it 'drops the first however many numbers from a block' do
    array1 = [1,2,3,4,5,6,7]
    expect(array1.drop(4)).to eq [5,6,7]
  end

  it 'drops an element from an array while a condition is true' do
    a = [1, 2, 3, 4, 5, 0]
    a.drop_while { |i| i < 3 }   #=> [3, 4, 5, 0]
  end

end
