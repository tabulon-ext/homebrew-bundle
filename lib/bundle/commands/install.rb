# frozen_string_literal: true

module Bundle
  module Commands
    module Install
      module_function

      def run(global: false, file: nil, no_lock: false, no_upgrade: false, verbose: false, force: false)
        parsed_entries = Bundle::Dsl.new(Brewfile.read(global:, file:)).entries
        Bundle::Installer.install(
          parsed_entries,
          global:, file:, no_lock:, no_upgrade:, verbose:, force:,
        ) || exit(1)
      end
    end
  end
end
