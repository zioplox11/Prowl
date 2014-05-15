class SearchController < ApplicationController

  def search
    # Get search params from request and run a
    # search for users against those params.
  end

  def matches
    # Get the current user and search for other
    # users that are within a set proximity and
    # have some things in common. Logic can go
    # in the user model or in a new search model.
  end

end
