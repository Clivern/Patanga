# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule PatangaTest do
  use ExUnit.Case
  doctest Patanga

  test "validate the version" do
    assert Patanga.version() == "0.1.0"
  end
end
