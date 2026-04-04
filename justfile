rb:
	sudo nixos-rebuild switch --impure --flake /home/andrew/git/nixos-dotfiles#nixos
gc:
	nix store gc
gc-gen:
	sudo nix-env --delete-generations +10 --profile /nix/var/nix/profiles/system