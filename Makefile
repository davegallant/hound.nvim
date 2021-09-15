fmt:
	stylua lua/

test:
	nvim --headless --clean \
	-u lua/hound/tests/minimal.vim \
	-c "PlenaryBustedDirectory lua/hound/tests/ {minimal_init = 'lua/hound/tests/minimal.vim'}"

lint:
	luacheck lua/*

pr-ready: fmt test lint

