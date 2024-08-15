`include "standard_cells.v"

(* dynports =  1  *)
(* top =  1  *)
(* src = "ahb_to_apb.v:19" *)
module ahb_to_apb(HCLK, HRESETn, PCLKEN, HSEL, HADDR, HTRANS, HSIZE, HPROT, HWRITE, HREADY, HWDATA, HREADYOUT, HRDATA, HRESP, PADDR, PENABLE, PWRITE, PSTRB, PPROT, PWDATA, PSEL, APBACTIVE, PRDATA, PREADY, PSLVERR);
  (* src = "ahb_to_apb.v:127" *)
  wire [13:0] _000_;
  (* src = "ahb_to_apb.v:127" *)
  wire [1:0] _001_;
  (* src = "ahb_to_apb.v:127" *)
  wire [3:0] _002_;
  (* src = "ahb_to_apb.v:246" *)
  wire [31:0] _003_;
  (* src = "ahb_to_apb.v:127" *)
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  (* src = "ahb_to_apb.v:55" *)
  output APBACTIVE;
  (* src = "ahb_to_apb.v:35" *)
  input [15:0] HADDR;
  (* src = "ahb_to_apb.v:30" *)
  input HCLK;
  (* src = "ahb_to_apb.v:38" *)
  input [3:0] HPROT;
  (* src = "ahb_to_apb.v:44" *)
  output [31:0] HRDATA;
  (* src = "ahb_to_apb.v:40" *)
  input HREADY;
  (* src = "ahb_to_apb.v:43" *)
  output HREADYOUT;
  (* src = "ahb_to_apb.v:31" *)
  input HRESETn;
  (* src = "ahb_to_apb.v:45" *)
  output HRESP;
  (* src = "ahb_to_apb.v:34" *)
  input HSEL;
  (* src = "ahb_to_apb.v:37" *)
  input [2:0] HSIZE;
  (* src = "ahb_to_apb.v:36" *)
  input [1:0] HTRANS;
  (* src = "ahb_to_apb.v:41" *)
  input [31:0] HWDATA;
  (* src = "ahb_to_apb.v:39" *)
  input HWRITE;
  (* src = "ahb_to_apb.v:47" *)
  output [15:0] PADDR;
  (* src = "ahb_to_apb.v:32" *)
  input PCLKEN;
  (* src = "ahb_to_apb.v:48" *)
  output PENABLE;
  (* src = "ahb_to_apb.v:51" *)
  output [2:0] PPROT;
  (* src = "ahb_to_apb.v:59" *)
  input [31:0] PRDATA;
  (* src = "ahb_to_apb.v:60" *)
  input PREADY;
  (* src = "ahb_to_apb.v:53" *)
  output PSEL;
  (* src = "ahb_to_apb.v:61" *)
  input PSLVERR;
  (* src = "ahb_to_apb.v:50" *)
  output [3:0] PSTRB;
  (* src = "ahb_to_apb.v:52" *)
  output [31:0] PWDATA;
  (* src = "ahb_to_apb.v:49" *)
  output PWRITE;
  (* src = "ahb_to_apb.v:67" *)
  wire [13:0] addr_reg;
  (* src = "ahb_to_apb.v:78" *)
  wire [2:0] next_state;
  (* src = "ahb_to_apb.v:74" *)
  (* unused_bits = "1" *)
  wire [1:0] pprot_nxt;
  (* src = "ahb_to_apb.v:73" *)
  wire [1:0] pprot_reg;
  (* src = "ahb_to_apb.v:71" *)
  wire [3:0] pstrb_reg;
  (* src = "ahb_to_apb.v:81" *)
  wire reg_rdata_cfg;
  (* src = "ahb_to_apb.v:82" *)
  wire reg_wdata_cfg;
  (* src = "ahb_to_apb.v:79" *)
  wire [31:0] rwdata_reg;
  (* src = "ahb_to_apb.v:147" *)
  wire sample_wdata_set;
  (* src = "ahb_to_apb.v:69" *)
  wire [2:0] state_reg;
  (* src = "ahb_to_apb.v:68" *)
  wire wr_reg;
  assign _005_ = ~state_reg[1];
  assign _006_ = ~state_reg[0];
  assign _007_ = ~((_005_ | state_reg[2]) & _006_);
  assign HREADYOUT = ~_007_;
  assign _008_ = ~state_reg[2];
  assign _009_ = ~(state_reg[0] & state_reg[1]);
  assign PENABLE = _008_ & ~(_009_);
  assign _010_ = state_reg[2] | ~(state_reg[1]);
  assign PSEL = ~_010_;
  assign _011_ = ~PCLKEN;
  assign _012_ = ~(PENABLE & PREADY);
  assign _013_ = _012_ | _011_;
  assign _003_[0] = _013_ ? rwdata_reg[0] : PRDATA[0];
  assign _003_[1] = _013_ ? rwdata_reg[1] : PRDATA[1];
  assign _003_[2] = _013_ ? rwdata_reg[2] : PRDATA[2];
  assign _003_[3] = _013_ ? rwdata_reg[3] : PRDATA[3];
  assign _003_[4] = _013_ ? rwdata_reg[4] : PRDATA[4];
  assign _003_[5] = _013_ ? rwdata_reg[5] : PRDATA[5];
  assign _003_[6] = _013_ ? rwdata_reg[6] : PRDATA[6];
  assign _003_[7] = _013_ ? rwdata_reg[7] : PRDATA[7];
  assign _003_[8] = _013_ ? rwdata_reg[8] : PRDATA[8];
  assign _003_[9] = _013_ ? rwdata_reg[9] : PRDATA[9];
  assign _003_[10] = _013_ ? rwdata_reg[10] : PRDATA[10];
  assign _003_[11] = _013_ ? rwdata_reg[11] : PRDATA[11];
  assign _003_[12] = _013_ ? rwdata_reg[12] : PRDATA[12];
  assign _003_[13] = _013_ ? rwdata_reg[13] : PRDATA[13];
  assign _003_[14] = _013_ ? rwdata_reg[14] : PRDATA[14];
  assign _003_[15] = _013_ ? rwdata_reg[15] : PRDATA[15];
  assign _003_[16] = _013_ ? rwdata_reg[16] : PRDATA[16];
  assign _003_[17] = _013_ ? rwdata_reg[17] : PRDATA[17];
  assign _003_[18] = _013_ ? rwdata_reg[18] : PRDATA[18];
  assign _003_[19] = _013_ ? rwdata_reg[19] : PRDATA[19];
  assign _003_[20] = _013_ ? rwdata_reg[20] : PRDATA[20];
  assign _003_[21] = _013_ ? rwdata_reg[21] : PRDATA[21];
  assign _003_[22] = _013_ ? rwdata_reg[22] : PRDATA[22];
  assign _003_[23] = _013_ ? rwdata_reg[23] : PRDATA[23];
  assign _003_[24] = _013_ ? rwdata_reg[24] : PRDATA[24];
  assign _003_[25] = _013_ ? rwdata_reg[25] : PRDATA[25];
  assign _003_[26] = _013_ ? rwdata_reg[26] : PRDATA[26];
  assign _003_[27] = _013_ ? rwdata_reg[27] : PRDATA[27];
  assign _003_[28] = _013_ ? rwdata_reg[28] : PRDATA[28];
  assign _003_[29] = _013_ ? rwdata_reg[29] : PRDATA[29];
  assign _003_[30] = _013_ ? rwdata_reg[30] : PRDATA[30];
  assign _003_[31] = _013_ ? rwdata_reg[31] : PRDATA[31];
  assign _014_ = HTRANS[1] & HSEL;
  assign _015_ = ~(_014_ & HREADY);
  assign _016_ = ~HWRITE;
  assign _017_ = HADDR[1] | ~(HSIZE[0]);
  assign _018_ = _017_ & ~(HSIZE[1]);
  assign _019_ = HADDR[0] | HADDR[1];
  assign _020_ = ~((_019_ & _018_) | _016_);
  assign _002_[0] = _015_ ? pstrb_reg[0] : _020_;
  assign _021_ = HADDR[1] | ~(HADDR[0]);
  assign _022_ = ~((_021_ & _018_) | _016_);
  assign _002_[1] = _015_ ? pstrb_reg[1] : _022_;
  assign _023_ = ~((HSIZE[0] & HADDR[1]) | HSIZE[1]);
  assign _024_ = HADDR[0] | ~(HADDR[1]);
  assign _025_ = ~((_024_ & _023_) | _016_);
  assign _002_[2] = _015_ ? pstrb_reg[2] : _025_;
  assign _026_ = ~(HADDR[0] & HADDR[1]);
  assign _027_ = ~((_026_ & _023_) | _016_);
  assign _002_[3] = _015_ ? pstrb_reg[3] : _027_;
  assign _001_[0] = _015_ ? pprot_reg[0] : HPROT[1];
  assign _028_ = ~HPROT[0];
  assign _001_[1] = _015_ ? pprot_reg[1] : _028_;
  assign _004_ = _015_ ? wr_reg : HWRITE;
  assign _000_[0] = _015_ ? addr_reg[0] : HADDR[2];
  assign _000_[1] = _015_ ? addr_reg[1] : HADDR[3];
  assign _000_[2] = _015_ ? addr_reg[2] : HADDR[4];
  assign _000_[3] = _015_ ? addr_reg[3] : HADDR[5];
  assign _000_[4] = _015_ ? addr_reg[4] : HADDR[6];
  assign _000_[5] = _015_ ? addr_reg[5] : HADDR[7];
  assign _000_[6] = _015_ ? addr_reg[6] : HADDR[8];
  assign _000_[7] = _015_ ? addr_reg[7] : HADDR[9];
  assign _000_[8] = _015_ ? addr_reg[8] : HADDR[10];
  assign _000_[9] = _015_ ? addr_reg[9] : HADDR[11];
  assign _000_[10] = _015_ ? addr_reg[10] : HADDR[12];
  assign _000_[11] = _015_ ? addr_reg[11] : HADDR[13];
  assign _000_[12] = _015_ ? addr_reg[12] : HADDR[14];
  assign _000_[13] = _015_ ? addr_reg[13] : HADDR[15];
  assign _029_ = state_reg[1] | ~(state_reg[0]);
  assign _030_ = _029_ | _008_;
  assign _031_ = ~(_030_ & _007_);
  assign _032_ = _010_ & ~(_031_);
  assign _033_ = _015_ | PCLKEN;
  assign _034_ = _009_ | state_reg[2];
  assign _035_ = ~(PREADY & PSLVERR);
  assign _036_ = _035_ | _011_;
  assign _037_ = PSLVERR | ~(PREADY);
  assign _038_ = PCLKEN & ~(_037_);
  assign _039_ = ~((_038_ & _036_) | _034_);
  assign _040_ = state_reg[0] | ~(state_reg[1]);
  assign _041_ = _040_ | state_reg[2];
  assign _042_ = _041_ | _011_;
  assign _043_ = _042_ & ~(_039_);
  assign _044_ = ~((_033_ | _007_) & _043_);
  assign next_state[0] = _032_ ? _011_ : _044_;
  assign _045_ = _015_ | _011_;
  assign _046_ = ~((_045_ | _007_) & _030_);
  assign _047_ = PCLKEN & ~(_035_);
  assign _048_ = _038_ | _047_;
  assign _049_ = ~((_048_ | _034_) & _041_);
  assign _050_ = _049_ | _046_;
  assign next_state[1] = _032_ ? PCLKEN : _050_;
  assign _051_ = ~((_038_ | _047_) & PENABLE);
  assign next_state[2] = ~((_051_ & _030_) | _032_);
  assign HRESP = ~((_029_ & _040_) | _008_);
  assign _052_ = state_reg[1] | state_reg[2];
  assign _053_ = _052_ | state_reg[0];
  assign APBACTIVE = _053_ | _014_;
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _164_ (
    .C(HCLK),
    .D(_003_[0]),
    .Q(rwdata_reg[0]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _165_ (
    .C(HCLK),
    .D(_003_[1]),
    .Q(rwdata_reg[1]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _166_ (
    .C(HCLK),
    .D(_003_[2]),
    .Q(rwdata_reg[2]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _167_ (
    .C(HCLK),
    .D(_003_[3]),
    .Q(rwdata_reg[3]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _168_ (
    .C(HCLK),
    .D(_003_[4]),
    .Q(rwdata_reg[4]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _169_ (
    .C(HCLK),
    .D(_003_[5]),
    .Q(rwdata_reg[5]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _170_ (
    .C(HCLK),
    .D(_003_[6]),
    .Q(rwdata_reg[6]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _171_ (
    .C(HCLK),
    .D(_003_[7]),
    .Q(rwdata_reg[7]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _172_ (
    .C(HCLK),
    .D(_003_[8]),
    .Q(rwdata_reg[8]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _173_ (
    .C(HCLK),
    .D(_003_[9]),
    .Q(rwdata_reg[9]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _174_ (
    .C(HCLK),
    .D(_003_[10]),
    .Q(rwdata_reg[10]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _175_ (
    .C(HCLK),
    .D(_003_[11]),
    .Q(rwdata_reg[11]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _176_ (
    .C(HCLK),
    .D(_003_[12]),
    .Q(rwdata_reg[12]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _177_ (
    .C(HCLK),
    .D(_003_[13]),
    .Q(rwdata_reg[13]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _178_ (
    .C(HCLK),
    .D(_003_[14]),
    .Q(rwdata_reg[14]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _179_ (
    .C(HCLK),
    .D(_003_[15]),
    .Q(rwdata_reg[15]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _180_ (
    .C(HCLK),
    .D(_003_[16]),
    .Q(rwdata_reg[16]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _181_ (
    .C(HCLK),
    .D(_003_[17]),
    .Q(rwdata_reg[17]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _182_ (
    .C(HCLK),
    .D(_003_[18]),
    .Q(rwdata_reg[18]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _183_ (
    .C(HCLK),
    .D(_003_[19]),
    .Q(rwdata_reg[19]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _184_ (
    .C(HCLK),
    .D(_003_[20]),
    .Q(rwdata_reg[20]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _185_ (
    .C(HCLK),
    .D(_003_[21]),
    .Q(rwdata_reg[21]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _186_ (
    .C(HCLK),
    .D(_003_[22]),
    .Q(rwdata_reg[22]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _187_ (
    .C(HCLK),
    .D(_003_[23]),
    .Q(rwdata_reg[23]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _188_ (
    .C(HCLK),
    .D(_003_[24]),
    .Q(rwdata_reg[24]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _189_ (
    .C(HCLK),
    .D(_003_[25]),
    .Q(rwdata_reg[25]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _190_ (
    .C(HCLK),
    .D(_003_[26]),
    .Q(rwdata_reg[26]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _191_ (
    .C(HCLK),
    .D(_003_[27]),
    .Q(rwdata_reg[27]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _192_ (
    .C(HCLK),
    .D(_003_[28]),
    .Q(rwdata_reg[28]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _193_ (
    .C(HCLK),
    .D(_003_[29]),
    .Q(rwdata_reg[29]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _194_ (
    .C(HCLK),
    .D(_003_[30]),
    .Q(rwdata_reg[30]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:246" *)
  DFF_PN0 _195_ (
    .C(HCLK),
    .D(_003_[31]),
    .Q(rwdata_reg[31]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:237" *)
  DFF_PN0 _196_ (
    .C(HCLK),
    .D(next_state[0]),
    .Q(state_reg[0]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:237" *)
  DFF_PN0 _197_ (
    .C(HCLK),
    .D(next_state[1]),
    .Q(state_reg[1]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:237" *)
  DFF_PN0 _198_ (
    .C(HCLK),
    .D(next_state[2]),
    .Q(state_reg[2]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _199_ (
    .C(HCLK),
    .D(_000_[0]),
    .Q(addr_reg[0]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _200_ (
    .C(HCLK),
    .D(_000_[1]),
    .Q(addr_reg[1]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _201_ (
    .C(HCLK),
    .D(_000_[2]),
    .Q(addr_reg[2]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _202_ (
    .C(HCLK),
    .D(_000_[3]),
    .Q(addr_reg[3]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _203_ (
    .C(HCLK),
    .D(_000_[4]),
    .Q(addr_reg[4]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _204_ (
    .C(HCLK),
    .D(_000_[5]),
    .Q(addr_reg[5]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _205_ (
    .C(HCLK),
    .D(_000_[6]),
    .Q(addr_reg[6]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _206_ (
    .C(HCLK),
    .D(_000_[7]),
    .Q(addr_reg[7]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _207_ (
    .C(HCLK),
    .D(_000_[8]),
    .Q(addr_reg[8]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _208_ (
    .C(HCLK),
    .D(_000_[9]),
    .Q(addr_reg[9]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _209_ (
    .C(HCLK),
    .D(_000_[10]),
    .Q(addr_reg[10]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _210_ (
    .C(HCLK),
    .D(_000_[11]),
    .Q(addr_reg[11]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _211_ (
    .C(HCLK),
    .D(_000_[12]),
    .Q(addr_reg[12]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _212_ (
    .C(HCLK),
    .D(_000_[13]),
    .Q(addr_reg[13]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _213_ (
    .C(HCLK),
    .D(_004_),
    .Q(wr_reg),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _214_ (
    .C(HCLK),
    .D(_002_[0]),
    .Q(pstrb_reg[0]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _215_ (
    .C(HCLK),
    .D(_002_[1]),
    .Q(pstrb_reg[1]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _216_ (
    .C(HCLK),
    .D(_002_[2]),
    .Q(pstrb_reg[2]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _217_ (
    .C(HCLK),
    .D(_002_[3]),
    .Q(pstrb_reg[3]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _218_ (
    .C(HCLK),
    .D(_001_[0]),
    .Q(pprot_reg[0]),
    .R(HRESETn)
  );
  (* src = "ahb_to_apb.v:127" *)
  DFF_PN0 _219_ (
    .C(HCLK),
    .D(_001_[1]),
    .Q(pprot_reg[1]),
    .R(HRESETn)
  );
  assign HRDATA = rwdata_reg;
  assign PADDR = { addr_reg, 2'h0 };
  assign PPROT = { pprot_reg[1], 1'h0, pprot_reg[0] };
  assign PSTRB = pstrb_reg;
  assign PWDATA = HWDATA;
  assign PWRITE = wr_reg;
  assign pprot_nxt[0] = HPROT[1];
  assign reg_rdata_cfg = 1'h1;
  assign reg_wdata_cfg = 1'h0;
  assign sample_wdata_set = 1'h0;
endmodule
