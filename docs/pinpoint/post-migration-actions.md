# Post Migration Actions

After migration completes, review the migration report and complete the following actions before enabling production use.

## Required actions

1. Review created resources in the Amazon Connect console.
2. Validate message delivery for email, SMS, and voice channels.
3. Review imported Contact Flows in the Connect console and replace any unresolved placeholder ARNs. Placeholders that may require manual replacement include `<CONNECT_EMAIL_ADDRESS>`, `<WISDOM_KNOWLEDGE_BASE_ARN>`, and `<CONNECT_PHONENUMBER_ARN>`. Template and segment ARNs are resolved automatically if those resources were previously imported.
4. Configure email unsubscribe and suppression logic in the target environment (not migrated by the tool).
5. Verify and adjust service quotas in Amazon Connect if needed.
6. Rebuild unsupported features manually, using the migration report as a guide.
7. Test all migrated campaigns and journeys in a non-production configuration before enabling production use.
8. Review the template version history archive in S3 for compliance needs.

!!! info ""
    Starting migrated campaigns

    Imported campaigns are created in Initialized state. They are not started automatically. Review each campaign in the Amazon Connect console, confirm settings, and start campaigns manually when ready.


***
