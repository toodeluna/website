alias help := default

# List all the available recipes.
@default:
	just --list flake

# Show the ouputs of the Nix flake for the current system.
[group('Outputs')]
[no-cd]
@show:
	nix flake show

# Show the ouputs of the Nix flake for all systems.
[group('Outputs')]
[no-cd]
@show-all:
	nix flake show --all-systems

# Check the ouputs of the Nix flake.
[group('Outputs')]
[no-cd]
@check:
	nix flake check

# Update the Nix flake lockfile.
[group('Inputs')]
[no-cd]
@lock:
	nix flake lock

# Update the specified inputs of the Nix flake or all inputs of none are specified.
[group('Inputs')]
[no-cd]
@update *inputs:
	nix flake update {{ inputs }}
