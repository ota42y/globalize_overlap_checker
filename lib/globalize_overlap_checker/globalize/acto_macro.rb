require 'globalize'
require 'active_record'

module Globalize
  module ActiveRecord
    module ActMacro

      protected

      def globalize_overlap_checker_check_columns!(attr_names)
        if table_exists? && translation_class.table_exists? && (overlap = attr_names.map(&:to_s) & column_names).present?
          if ::GlobalizeOverlapChecker.prohibition_overlap?
            raise ::GlobalizeOverlapChecker::GlobalizeOverlapError.
                new("overlap translate columns!\nModel name (table name): #{model_name} (#{table_name})\nAttribute name(s): #{overlap.join(', ')}\n")
          else
            ::GlobalizeOverlapChecker.add_overlap_model(table_name, overlap)
          end
        end

        globalize_overlap_checker_original_check_columns!(attr_names)
      end

      alias_method :globalize_overlap_checker_original_check_columns!, :check_columns!
      alias_method :check_columns!, :globalize_overlap_checker_check_columns!
    end
  end
end
