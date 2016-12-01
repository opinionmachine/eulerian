defmodule Eulerian do
	def degree(edges, vertex) do
		degree edges, vertex, 0
	end
	#end
	def degree([{vertex, _} | rest] , vertex, count) do
		degree rest, vertex, count + 1
	end
	def degree([{_, vertex} | rest] , vertex, count) do
		degree rest, vertex, count + 1
	end
	def degree([{_, _} | rest] , vertex, count) do
		degree rest, vertex, count
	end
	def degree([] , _vertex, count) do
		count
	end


	def vertices(edges) do
		Enum.dedup vertices(edges, [])
	end
	def vertices([{vertex1, vertex2} | rest], found) do
		vertices rest, found  ++ [vertex1] ++ [vertex2]
	end
	def vertices([], found) do
		found
	end

	def eulerian_path?([]) do
		:false
	end
	def eulerian_path?(edges) do
		eulerian_path?(vertices(edges), edges, 0) <= 2
	end
	def eulerian_path?([head | vertices], edges, found_odd) do 
		eulerian_path?(vertices, edges, (found_odd + rem degree(edges, head), 2))
	end
	def eulerian_path?([], edges, found_odd) do 
		found_odd
	end
end
