Feature company-cabal candidates

  Scenario: Library candidates
    Given the buffer is empty
    When I insert:
    """
    library
      
    """
    And I execute company-cabal candidates command at current point
    Then company-cabal candidates contains "exposed-modules"

  Scenario: Executable candidates
    Given the buffer is empty
    When I insert:
    """
    executable foo
      
    """
    And I execute company-cabal candidates command at current point
    Then company-cabal candidates contains "main-is"

  Scenario: Test-suite candidates
    Given the buffer is empty
    When I insert:
    """
    test-suite test-foo
      
    """
    And I execute company-cabal candidates command at current point
    Then company-cabal candidates contains "type"
    And company-cabal candidates contains "main-is"
    And company-cabal candidates contains "test-module"

  Scenario: Benchmark candidates
    Given the buffer is empty
    When I insert:
    """
    benchmark bench-foo
      
    """
    And I execute company-cabal candidates command at current point
    Then company-cabal candidates contains "type"
    And company-cabal candidates contains "main-is"

  Scenario: Flag candidates
    Given the buffer is empty
    When I insert:
    """
    flag flag-foo
      
    """
    And I execute company-cabal candidates command at current point
    Then company-cabal candidates are:
    """
    ("description" "default" "manual")
    """

  Scenario: Source-repoistory candidates
    Given the buffer is empty
    When I insert:
    """
    source-repository head
      
    """
    And I execute company-cabal candidates command at current point
    Then company-cabal candidates are:
    """
    ("type" "location" "module" "branch" "tag" "subdir")
    """

  Scenario: Build-type candidates
    Given the buffer is empty
    When I insert:
    """
    build-type: 
    """
    And I execute company-cabal candidates command at current point
    Then company-cabal candidates are:
    """
    ("Simple" "Configure" "Make" "Custom")
    """
