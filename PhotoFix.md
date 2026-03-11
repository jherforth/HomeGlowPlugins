Fixing plugins that require/utilize profile photos (a self-contained HTML file) for the HomeGlow dashboard. The widget runs inside a sandboxed iframe served from the same origin as the backend API.

How the API works:

GET /api/users returns an array of user objects. Each user has:

id, username, email, clam_total
profile_picture — this is either an empty string (no photo) or a bare filename like user_1_1748392847123.jpg
Profile picture files are served at: /Uploads/users/<filename>

So to build the full image URL from a profile_picture value, do this:

const apiBase = window.location.origin; // DO NOT hardcode a port number
const imageUrl = `${apiBase}/Uploads/users/${user.profile_picture}`;
If profile_picture is an empty string or null, show a text avatar fallback (first letter of the username).

The correct pattern to display a user avatar:


function renderAvatar(user) {
  const apiBase = window.location.origin;
  if (user.profile_picture) {
    return `<img
      src="${apiBase}/Uploads/users/${user.profile_picture}"
      alt="${user.username}"
      style="width:48px;height:48px;border-radius:50%;object-fit:cover;"
      onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';"
    /><div style="display:none;width:48px;height:48px;border-radius:50%;background:var(--accent);align-items:center;justify-content:center;font-weight:bold;">
      ${user.username.charAt(0).toUpperCase()}
    </div>`;
  }
  return `<div style="width:48px;height:48px;border-radius:50%;background:var(--accent);display:flex;align-items:center;justify-content:center;font-weight:bold;">
    ${user.username.charAt(0).toUpperCase()}
  </div>`;
}
Common mistakes to avoid:

Do NOT hardcode a port like :5001 or :3000 in the URL — always use window.location.origin
Do NOT prepend /Uploads/users/ twice — the API returns just the bare filename, not a path
Do NOT use the full URL returned by the API as a path segment — it already is the filename only
Always include an onerror fallback on <img> tags in case the file is missing
