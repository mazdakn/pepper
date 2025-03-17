#include "xdp.h"

SEC("drop")
int xdp_drop(struct xdp_md *ctx) {
    return XDP_DROP;
}
