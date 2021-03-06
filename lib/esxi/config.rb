require "vagrant"

module VagrantPlugins
  module ESXi
    class Config < Vagrant.plugin("2", :config)
      attr_accessor :host
      attr_accessor :user
      attr_accessor :password
      attr_accessor :name
      attr_accessor :datastore
      attr_accessor :vmx
      attr_accessor :network

      def validate(machine)
        errors = _detected_errors

        errors << I18n.t("config.host") if host.nil?
        errors << I18n.t("config.user") if user.nil?
        errors << I18n.t("config.password") if password.nil?
        errors << I18n.t("config.name") if name.nil?
        errors << I18n.t("config.datastore") if datastore.nil?
        errors << I18n.t("config.vmx") if vmx.nil?
        errors << I18n.t("config.network") if vmx.nil?

        { "esxi Provider" => errors }
      end
    end
  end
end
