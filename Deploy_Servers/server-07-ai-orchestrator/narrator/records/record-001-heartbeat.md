# Narrator Reason Record

## Item Name
Heartbeat State

## Item Type
- platform

## What Is It?
Heartbeat is the measurable living state of the constellation.

## Why Was It Introduced?
To allow the constellation to know whether it has been initialized, deployed, and whether it is steady, degraded, failed, or evolving.

## Which Layer Does It Belong To?
- foundation
- ci-cd
- monitoring

## Is It Platform or Application?
Platform

## What Problem Does It Solve?
It prevents the deployment from being stateless and gives the system a way to express its current condition.

## What Does It Affect?
Deployment, monitoring, narration, and future governance behavior.

## What Happens If It Is Not Added?
The constellation would deploy blindly without memory of its condition.

## Who Requested It?
Foundational system design.

## What Flow Does It Participate In?
Deployment heartbeat and all later governed flows.

## How Should It Be Observed Later?
Through deployment-state, deploy logs, and narrator summaries.

## Status
- implemented

## Final Narrator Note
Heartbeat turned deployment into living state.
