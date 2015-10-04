angular.module('theAnchorman')
.factory('ToiletStatus', function() {
  return {
    text: function(toilet) {
      var resultStatus = 'Error loading toilet status :(';
      var toiletUpdatedAt = new Date(toilet.updated_at);

      if (toilet) {
        switch (toilet.state) {
          case 'available':
            resultStatus = '<b>Available</b>';
          case 'occupied':
            resultStatus = '<b>Occupied</b>';
          case 'offline':
            resultStatus = '<b>Offline</b>';
        }
      }

      resultStatus = resultStatus + ' since ' + timeAgoInWords(toiletUpdatedAt);

      return resultStatus;
    },
    iconClass: function(toilet) {
      if (toilet) {
        switch(toilet.state) {
          case 'available':
            return 'glyphicon-ok';
          case 'occupied':
            return 'glyphicon-remove';
          case 'offline':
            return 'glyphicon-exclamation-sign';
        }
      } else {
        return '';
      }
    }
  }
});
