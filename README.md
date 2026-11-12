# Lets Encrypt Sync to Web Farm

The web nodes funnel ``well-known`` requests back to a control node, which
does the renewal.  A post-hook then copies the resulting certs back to the
web nodes and reloads {nginx,apache}.
