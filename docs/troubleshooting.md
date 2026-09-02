# Troubleshooting

This page collects fixes for common issues in CxPortal. Work through the steps for your issue, and if it is still not resolved, see [Submitting a Support Request](../submitting-a-support-request/).

## Instance Data Not Loading in Chrome or Edge (Local Network Access Blocked)

**Applies to:** CxPortal users on Google Chrome version 142 or later, or Microsoft Edge version 142 or later

**Symptom:** Pages that show your Amazon Connect instance data fail to load, show empty tables, or display a loading error — even though you can sign in and navigate the portal normally.

### Cause

Recent versions of Chrome and Edge include a security feature called *Local Network Access*. When a website tries to reach an endpoint on your local or private network, the browser now asks for permission first. If you clicked **Block** on that prompt (or dismissed it), the browser silently blocks those requests from then on — and CxPortal cannot retrieve your instance data.

This typically affects you when you access CxPortal from a corporate network or VPN where the endpoints serving your instance data resolve to private network addresses. The rest of the portal keeps working because only the blocked requests fail.

Allowing local network access for CxPortal resolves the issue. The permission only lets CxPortal complete the requests it already makes — it does not give the site access to anything else on your network.

### Allow local network access in Chrome

1. Open CxPortal in Chrome.

2. Click the tune icon (or padlock) to the left of the address bar.

3. Click **Site settings**.

4. Find **Local network access** and change it to **Allow**.

5. Return to the CxPortal tab and reload the page.

If you do not see the permission in the list, go to `chrome://settings/content/localNetworkAccess`, remove the CxPortal address from the **Not allowed** list, and reload CxPortal. When the permission prompt appears again, click **Allow**.

### Allow local network access in Edge

1. Open CxPortal in Edge.

2. Click the padlock icon to the left of the address bar.

3. Click **Permissions for this site**.

4. Find **Local network access** and change it to **Allow**.

5. Return to the CxPortal tab and reload the page.

You can also manage this from **Settings** > **Cookies and site permissions** > **Local network access**.

{% hint style="info" %}
The permission is saved per browser profile. If you use CxPortal in an Incognito or InPrivate window, or in a different browser profile, you may need to allow it again there.
{% endhint %}

### If the setting is grayed out or the prompt never appears

On company-managed devices, your IT team may control this permission centrally. If you cannot change the setting, ask your IT administrator to allow the CxPortal URL. Both Chrome and Edge support the same enterprise policies:

- **LocalNetworkAccessAllowedForUrls** — pre-grants the permission for listed sites (add the CxPortal URL here)

- **LocalNetworkAccessBlockedForUrls** — pre-denies the permission for listed sites (confirm the CxPortal URL is not listed)

- **LocalNetworkAccessRestrictionsEnabled** — when enabled, denies all local network requests without prompting

### Verify the fix

1. Reload the CxPortal page that failed to load.

2. If the browser shows a permission prompt asking to access devices on your local network, click **Allow**.

3. Confirm your instance data now loads.

Once allowed, the browser remembers your choice for CxPortal. You do not need to repeat these steps unless you clear your browser's site settings or switch profiles.

### Still not working?

If instance data still does not load after allowing the permission:

- Confirm you are connected to the VPN or network required to reach your instance, if your organization uses one

- Try a full browser restart, since some permission changes only take effect in new sessions

- [Submit a support request](../submitting-a-support-request/) and include your browser name and version, whether your device is company-managed, and a screenshot of the error
