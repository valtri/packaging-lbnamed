
package LBCD;

use constant PROTO_PORTNUM        => 4330;
use constant PROTO_MAXMESG        => 2048;
use constant PROTO_VERSION        => 2;

use constant OP_LB_INFO           => 1;    # load balance info, request and reply

use constant STATUS_REQUEST       => 0;    # /* a request packet */
use constant STATUS_OK            => 1;    # /* load balance info, request and reply */
use constant STATUS_ERROR         => 2;    # /* generic error */
use constant STATUS_PROTO_VERSION => 3;    # /* protocol version error */
use constant STATUS_PROTO_ERROR   => 4;    # /* generic protocol error */
use constant STATUS_UNKNOWN_OP    => 5;    # /* unknown operation requested */

# typedef struct {
#   u_short   version;  /* protocol version */
#   u_short   id;       /* requestor's uniq request id */
#   u_short   op;       /* operation requested */
#   u_short   status;   /* set on reply */
# } P_HEADER,*P_HEADER_PTR;

use constant P_HEADER => 'nnnn';

# typedef struct {
#   P_HEADER h;
#   u_int boot_time;
#   u_int current_time;
#   u_int user_mtime;  /* time user information last changed */
#   u_short l1; /* (int) (load*100) */
#   u_short l5;
#   u_short l15;
#   u_short tot_users;  /* total number of users logged in */
#   u_short uniq_users; /* total number of uniq users */
#   u_char  on_console; /* true if somone on console */
#   u_char  reserved;   /* future use, padding... */
# } P_LB_RESPONSE, *P_LB_RESPONSE_PTR;

use constant P_LB_RESPONSE => P_HEADER . 'NNNnnnnnCC';

1;
