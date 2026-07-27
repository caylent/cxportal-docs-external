# Developer Reference: Node.js Client

!!! info ""
    **Note:** This page is intended for developers integrating DFC data into Amazon Connect contact flows or Lambda functions.


## Overview

The DFC Node.js Client is used to query DFC data programmatically. It resolves items and entities by path for a given Amazon Connect instance.

!!! info ""
    **Note:**&#x54;his package is not published to the public NPM registry. You must request it from Pronetx before installation.


***

### Installation

#### Peer Dependencies — Install the required AWS SDK packages:

```bash
npm install @aws-sdk/client-dynamodb @aws-sdk/lib-dynamodb
```

***

### Quick Start

```javascript
import { DfcQueryClient } from '@pronetx/cx-portal-dfc-client';

const client = new DfcQueryClient({
  region: 'us-west-2',
  entityTableName: 'dfc-entity-personal',
  itemTableName: 'dfc-config-item-personal',
  connectRegion: 'us-east-1' // optional
});
```

!!! info ""
    **Note:** The Lambda execution role must have read access to both the entity table and item table, including all GSIs.


***

### Configuration

| Option            | Type        | Required | Description                                                            |
| ----------------- | ----------- | -------- | ---------------------------------------------------------------------- |
| `region`          | string      | Yes      | AWS region where the DynamoDB tables are hosted.                       |
| `entityTableName` | string      | Yes      | Name of the DFC entity DynamoDB table.                                 |
| `itemTableName`   | string      | Yes      | Name of the DFC config item DynamoDB table.                            |
| `credentials`     | Credentials | No       | Optional AWS credentials. Defaults to environment or role credentials. |
| `connectRegion`   | string      | No       | If provided, rewrites `connect_resource` ARNs to use this region.      |

***

### Methods

```
queryByPath(instanceId, path)
```

Queries a single path for a given Connect instance. Behavior varies by path format.

| Path Format                           | Behavior                                                                                               |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `/`                                   | Returns all root-level entities.                                                                       |
| `/some/path/` (trailing slash)        | Returns the entity at that path, its child entities, its items, and resolved default attribute values. |
| `/some/path/item` (no trailing slash) | Returns the specific item at that path and its attributes.                                             |

```javascript
const result = await client.queryByPath('my-instance-id', '/routing/queues/');
```

**Returns:** `Promise<QueryByPathResponse>`

***

```
queryByPathBatch(instanceId, paths)
```

Runs multiple `queryByPath` calls in parallel.

```javascript
const results = await client.queryByPathBatch('my-instance-id', [
  '/routing/queues/',
  '/routing/flows/my-flow'
]);
```

**Returns:** `Promise<QueryByPathResponse[]>`

***

### Response Shape (`QueryByPathResponse`)

```javascript
{
  message: string;          // Human-readable status message
  entities: EntityRecord[]; // Child entities found at this path
  items: ItemRecord[];      // Config items found at this path
  entity: EntityRecord | null; // The direct entity match (if path ends with /)
  item: ItemRecord | null;  // The direct item match (if path has no trailing /)
  evaluated: Record<string, any>; // Resolved configuration values — use this in most cases
}
```

The `evaluated` field contains the final merged and resolved configuration values. For entity paths, it reflects entity defaults resolved through the item service. For item paths, it contains the item's attributes directly.

***

### Error Handling

All query errors are thrown as `DfcQueryError` instances with a descriptive message. Wrap calls in `try/catch`:

```javascript
try {
  const result = await client.queryByPath(instanceId, path);
} catch (err) {
  if (err.name === 'DfcQueryError') {
    console.error('DFC query failed:', err.message);
  }
}
```

#### Common Error Conditions

* Path is empty or not provided.
* No entity found at the given path.
* No item found at the given path.
* Missing required config fields (`region`, `entityTableName`, `itemTableName`).

***
