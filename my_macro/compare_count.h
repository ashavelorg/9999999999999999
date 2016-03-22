	typedef struct {
	  int lt;
	  int eq;
	  int gt;
	  } cmp_count_Struct;

        void cmp_count__dbg (int64_t v0, int64_t v1, int reset,
			int *lt, int *eq, int *gt, cmp_count_Struct *state);
