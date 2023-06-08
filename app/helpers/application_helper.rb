module ApplicationHelper
  def ability_to_string(ability)
    case ability
    when 0
      "just beginning"
    when 1
      "pretty decent"
    else
      "musical god"
    end
  end

  def commitment_to_string(commitment)
    case commitment
    when 0
      "very casual"
    when 1
      "i want to play semi-regularly"
    else
      "very serious commitment"
    end
  end
end
