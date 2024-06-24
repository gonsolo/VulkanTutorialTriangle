all: test
test: Triangle shaders/frag.spv shaders/vert.spv
	./Triangle
shaders/frag.spv: shaders/09_shader_base.frag
	glslc shaders/09_shader_base.frag -o shaders/frag.spv
shaders/vert.spv: shaders/09_shader_base.vert
	glslc shaders/09_shader_base.vert -o shaders/vert.spv
Triangle: 17_swap_chain_recreation.cpp
	g++ -o Triangle 17_swap_chain_recreation.cpp -lglfw -lvulkan

.PHONY: all c clean test

c: clean
clean:
	rm -f Triangle shaders/frag.spv shaders/vert.spv
