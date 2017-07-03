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
    expect(a.drop_while { |i| i < 3 }).to eq [3, 4, 5, 0]
  end

  it 'iterates to give the different combinations from 0 to array length of a given number' do
    array = [1, 2, 3, 4]
    expect(array.each_cons(2).to_a).to eq [[1, 2], [2, 3], [3, 4]]
  end

  it 'iterates to give the given number as a slice of an array length' do
    array = [1, 2, 3, 4]
    expect(array.each_slice(2).to_a).to eq [[1, 2], [3, 4]]
  end

  it 'iterates over an element and its index' do
    array = [10, 20, 30, 40]
    array2 = []
    array.each_with_index { |num, index| array2 << num + index + 1}
    expect(array2).to eq [11, 22, 33, 44]
  end

  it 'finds the first element that is truthy ' do
    array = [1,2,3]
    expect(array.find { |num| num % 2 == 0 }).to eq 2
    expect(array.find { |num| num.odd? }).to eq 1
  end

  it 'finds all elements that are truthy and returns result an array' do
    array = [1,2,3]
    expect(array.find_all { |num| num % 2 == 0 }).to eq [2]
    expect(array.find_all { |num| num.odd? }).to eq [1, 3]
    expect(array.find_all { |num| num > 10 }).to eq []
  end

  it 'returns true or false if there is one' do
    array = [1,2,3]
    expect(array.one? { |num| num.even?} ).to eq true
    expect(array.one? { |num| num.odd?} ).to eq false
  end

  it 'returns the first of an array' do
    array = [1,2,3]
    expect(array.first).to eq 1
  end

  it 'flattens results' do
    array = [1,2]
    expect(array.flat_map {|num| ['a', 'b']}).to eq ['a', 'b', 'a', 'b']
  end

  it 'groups an array by the result of a given requirement' do
    array = [1,2,3,4]
    expect(array.group_by {|num| num.odd? }).to eq ({true => [1,3], false => [2,4]})
    expect(array.group_by {|num| num % 2 }).to eq ({1 => [1,3], 0 => [2,4]})
  end



end
