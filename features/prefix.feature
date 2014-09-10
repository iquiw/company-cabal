Feature: company-cabal prefix
  In order to find completion prefix
  Emacs user will need this sweet new feature

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

  Scenario: Non prefix
    Given the buffer is empty
    When I insert:
    """
    library
      build-depends:   base
      if os(windows)
        build-depends: Win32,
                       
    """
    And I execute company-cabal prefix command at current point
    Then company-cabal prefix none
