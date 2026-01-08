{
  lib,
  fetchFromGitHub,
  installShellFiles,
  php,
  versionCheckHook,
}:
php.buildComposerProject2 (finalAttrs: {
  pname = "phpactor";

	# https://github.com/NixOS/nixpkgs/blob/nixos-25.11/pkgs/by-name/ph/phpactor/package.nix#L10
	# all i did was bump the version
  version = "2025.12.21.0";

  src = fetchFromGitHub {
    owner = "phpactor";
    repo = "phpactor";
    tag = finalAttrs.version;
    hash = "sha256-wMyHkkN15kd2Q9BN3H2gJ3iNlRodric2DqWiWLU1Fj0=";
  };

  vendorHash = "sha256-wMyHkkN15kd2Q9BN3H2gJ3iNlRodric2DqWiWLU1Fj0=";

  nativeBuildInputs = [ installShellFiles ];

  postInstall = ''
    installShellCompletion --cmd phpactor \
      --bash <(php $out/bin/phpactor completion bash)
  '';

  doInstallCheck = true;
  nativeInstallCheckInputs = [ versionCheckHook ];
  versionCheckProgramArg = "--version";
})
