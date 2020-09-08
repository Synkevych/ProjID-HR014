# frozen_string_literal: true

module Audits
  # Service that create audit with answers
  # only if all answers present.
  class CreateService < ApplicationService
    attr_accessor :audit

    def initialize(audit, answer)
      @audit = audit
    end

    def call
      if check_for_answers == audit.checklist.cout_questions
        audit.create
      else
        audit.destroy
      end
    end

    private

    def check_for_answers
      audit.answers.count
    end
    
  end
end
