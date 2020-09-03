{
  "RajaUserTable" : {
    "attributes" : {
      "UserId"    : "S",
      "GameTitle" : "S",
      "TopScore"  : "N"
    },
    "hash_key"              : "UserId",
    "dynamo_enable_replica" : ${dynamo_enable_replica},
    "ttl_attribute"         : "TimeToExist",

    "local_secondary_indices" : {
      "GameTitleLSI" : {
        "range_key"          : "TopScore",
        "projection_type"    : "INCLUDE",
        "non_key_attributes" : []
      }
    },

    "global_secondary_indices" : {
      "GameTitleIndex" : {
        "hash_key"           : "GameTitle",
        "range_key"          : "TopScore",
        "write_capacity"     : 10,
        "read_capacity"      : 10,
        "projection_type"    : "INCLUDE",
        "non_key_attributes" : ["UserId"]
      }
    }
  }
  , 
    "SelvaUserTable" : {
    "attributes" : {
      "UserId"    : "S",
      "GameTitle" : "S"
    },
    "hash_key"              : "UserId",
    "range_key"             : "GameTitle",
    "dynamo_enable_replica" : ${dynamo_enable_replica},
    "local_secondary_indices" : {},
    "global_secondary_indices" : {}
  }

}
