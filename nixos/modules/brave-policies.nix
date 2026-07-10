{ ... }:

{
  environment.etc."brave/policies/managed/policies.json".text = builtins.toJSON {
    # Brave-specific features
    BraveRewardsDisabled = true;
    BraveWalletDisabled = true;
    BraveVPNDisabled = true;
    BraveAIChatEnabled = false;

    # Permission defaults (2 = Block)
    DefaultGeolocationSetting = 2;
    DefaultNotificationsSetting = 2;
    DefaultLocalFontsSetting = 2;
    DefaultSensorsSetting = 2;
    DefaultSerialGuardSetting = 2;

    # Reporting / telemetry
    CloudReportingEnabled = false;
    DriveDisabled = true;
    MetricsReportingEnabled = false;
    DeviceActivityHeartbeatEnabled = false;
    DeviceMetricsReportingEnabled = false;
    HeartbeatEnabled = false;
    LogUploadEnabled = false;
    ReportAppInventory = "";
    ReportDeviceActivityTimes = false;
    ReportDeviceAppInfo = false;
    ReportDeviceSystemInfo = false;
    ReportDeviceUsers = false;
    ReportWebsiteTelemetry = "";

    # Password manager
    PasswordManagerEnabled = false;
    PasswordSharingEnabled = false;
    PasswordLeakDetectionEnabled = false;

    # Safe Browsing (Google-kapcsolatok tiltása)
    SafeBrowsingExtendedReportingEnabled = false;
    SafeBrowsingSurveysEnabled = false;
    SafeBrowsingDeepScanningEnabled = false;

    # Misc privacy / features
    QuickAnswersEnabled = false;
    AlternateErrorPagesEnabled = false;
    AutofillCreditCardEnabled = false;
    BackgroundModeEnabled = false;
    BrowserGuestModeEnabled = false;
    BrowserSignin = 0;
    BuiltInDnsClientEnabled = false;
    DefaultBrowserSettingEnabled = false;
    ParcelTrackingEnabled = false;
    RelatedWebsiteSetsEnabled = false;
    ShoppingListEnabled = false;

    # Manifest V2 kiterjesztések engedélyezése (2 = engedélyezett)
    ExtensionManifestV2Availability = 2;
  };
}
