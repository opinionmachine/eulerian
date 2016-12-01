defmodule EulerianTest do
  use ExUnit.Case
  alias Eulerian 
  doctest Eulerian

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "Can calculate degree on an unknown vertex" do  
  	assert Eulerian.degree([], :a) == 0
  	assert Eulerian.degree([{:a, :b}], :a) == 1
  	assert Eulerian.degree([{:a, :b}], :b) == 1
  	assert Eulerian.degree([{:a, :b}], :c) == 0
  	assert Eulerian.degree([{:a, :b}, {:b, :c}], :a) == 1
	assert Eulerian.degree([{:a, :b}, {:b, :c}], :b) == 2
  end

  test "Can list vertices in graph" do
  	assert Eulerian.vertices([]) == []
  	assert Eulerian.vertices([{:a, :b}]) == [:a, :b]
	assert Eulerian.vertices([{:a, :b}, {:b, :c}]) == [:a, :b, :c]
  end

  test "Can determine eulerian potential" do
  	assert Eulerian.eulerian_path?([]) == :false
  	assert Eulerian.eulerian_path?([{:a, :b}]) == :true
	assert Eulerian.eulerian_path?([{:a, :b}, {:b, :c}]) == :true
	assert Eulerian.eulerian_path?([{:a, :b}, {:b, :c}, {:b, :d}]) == :false
  end

end
