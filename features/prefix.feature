Feature: company-cabal prefix

  Scenario: Top-level package description field prefix
    Given the buffer is empty
    When I execute company-cabal prefix command at current point
    Then company-cabal prefix is ""

    When I insert "Name"
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "Name"

    Given the buffer is empty
    When I insert:
    """
    Name: Test01
    Ver
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "Ver"

    Given the buffer is empty
    When I insert:
    """
    name: Test01
    version: 0.0.1
    cabal-ver
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "cabal-ver"

  Scenario: Library field prefix
    Given the buffer is empty
    When I insert:
    """
    name: Test01
    version: 0.0.1
    cabal-version: >= 1.2
    library
      
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is ""

    When I insert "build-dep"
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "build-dep"

    Given the buffer is empty
    When I insert:
    """
    Library
       Build-Depends:   base
       
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is ""

    When I insert "Exposed-Dep"
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "Exposed-Dep"

    Given the buffer is empty
    When I insert:
    """
    Library
       Build-Depends:   base
    
       Ghc-
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "Ghc-"

  Scenario: Executable field prefix
    Given the buffer is empty
    When I insert:
    """
    executable foo
      
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is ""

  Scenario: Prefix after condition
    Given the buffer is empty
    When I insert:
    """
    Library
      if os(windows)
        b
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "b"

    Given the buffer is empty
    When I insert:
    """
    Library
       if os(windows)
         build-depends: Win32
         ghc-
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "ghc-"

    Given the buffer is empty
    When I insert:
    """
    Library
       if os(windows)
         build-depends: Win32
       else
         
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is ""

  Scenario: Build-type prefix
    Given the buffer is empty
    When I insert:
    """
    build-type: Si
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "Si"

  Scenario: Type prefix
    Given the buffer is empty
    When I insert:
    """
    benchmark bench-foo
      type: e
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "e"

    Given the buffer is empty
    When I insert:
    """
    test-suite test-foo
      type: de
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "de"

    Given the buffer is empty
    When I insert:
    """
    source-repository head
      branch: master
      type:   gi
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "gi"

  Scenario: Hs-source-dirs prefix
    Given the buffer is empty
    When I insert:
    """
    library
      hs-source-dirs: 
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is ""

    Given the buffer is empty
    When I insert:
    """
    library
      hs-source-dirs: src, t
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "t"

    Given the buffer is empty
    When I insert:
    """
    library
      hs-source-dirs: src t
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "t"

    Given the buffer is empty
    When I insert:
    """
    library
      hs-source-dirs: src,
                      t
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "t"

    Given the buffer is empty
    When I insert:
    """
    library
      hs-source-dirs: src
                      t
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "t"

  Scenario: Build-depends prefix
    Given the buffer is empty
    When I insert:
    """
    library
      build-depends:   base >=4.6 && <4.8, byte
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is "byte"

    Given the buffer is empty
    When I insert:
    """
    library
      build-depends:   base
      if os(windows)
        build-depends: Win32,
                       
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix is ""
