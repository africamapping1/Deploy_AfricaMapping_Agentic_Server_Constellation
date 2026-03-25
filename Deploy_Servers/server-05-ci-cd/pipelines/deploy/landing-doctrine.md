# Landing Doctrine

## Slogan

All deploy needs is an SSH key.

## Meaning

Deployment should require only enough trust to land on the first receiving server.

It should not assume that the full constellation already exists.

At landing, deployment checks:

- one valid deploy user
- sudo capability
- basic directories
- ability to write logs
- ability to write deployment state

If landing is valid, deployment proceeds.
If landing is not valid, deployment stops with a clear reason.

## Principle

The truck arrives with identity and payload.

The loading dock provides the first place where the constellation becomes locally real.

## Deployment Line

Deploy needs SSH to land. The rest is established at landing.
