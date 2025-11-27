{ lib, ... }:
{
  fooOption = lib.nixvim.mkRaw "print('hello')";

  plugins.marksman.enable = true;
}
