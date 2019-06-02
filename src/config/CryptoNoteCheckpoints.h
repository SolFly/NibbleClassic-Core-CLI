// Copyright (c) 2012-2017, The CryptoNote developers, The Bytecoin developers
//
// This file is part of Bytecoin.
//
// Bytecoin is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Bytecoin is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with Bytecoin.  If not, see <http://www.gnu.org/licenses/>.

#pragma once

#include <cstddef>
#include <initializer_list>

namespace CryptoNote {
struct CheckpointData {
  uint32_t index;
  const char* blockId;
};

const std::initializer_list<CheckpointData> CHECKPOINTS = {
  { 0, "106cb1ac88b2502692ea4208ecd1d83a90cf9ecfc3eb7cd4ad76e2f2eb89a8b1"},
  { 5000, "916f9012b461f9bca35dd0dbf562594f512fd21f3f0c589fa292ffa020f2181c"},
  { 10000, "fa7f72be1f11546bbf286170e899512eaad1b7e01d3d7defa364635cee98e356"},
  { 15000, "70daefdb325605fa609dd0bccaf3623ecbb7cded3f1c3698206a5c9f083f7a64"},
  { 20000, "7200dfc18a476485a8ae181a5f55fb49a2513f88eb33c8277d33e3c26919c76e"},
  { 25000, "ae6b4df92a102cb7f6e8f4907aa94709e696310541c687361fc3541016fe4003"},
  { 30000, "318417409d093404edc6cb1c0ba4fe85ab3648cbccdab3997a8a30a2d65cc9d9"},
  { 35000, "319c09c30044ea0d45b46243e025e489d2e79d2ac138f44cd611ed9c4feed364"},
  { 40000, "5dde80bd5491283892e404c3fd576486cf072282e9c469e2bbc9342b99c29576"},
  { 45000, "dc77d184e6762b16b0bbdd49e42eddc8b7ecbbf0a47617bd7167d6e6499d5fda"},
  { 50000, "8c0d4f83e3aaa77aa704d0e5adc814debf2d9b597a9ed8612b1f8baa460113f9"},
  { 55000, "6332ac9513c7f628a42e3566eef4cc955d1d3207303d4ab4374b06b9f25341fe"},
  { 60000, "bb88e202b13dfd99489c13a4c7a6725de041131718ba51f340b729508a1a803b"},
  { 65000, "6a69a0b0608ab8b0c7ea333de3b4500d9aff41d794ca7bdce1b5a821c9a24e80"},
  { 70000, "13dbdbf17fb44f29092dd2a7cc6a2da3b5a0b5f493144ce44e104b89ab47fe16"},
  { 75000, "a1458533cdb3798184253d10404bc9608b7ff925f27f8b01fcb5881ca8b70e6f"},
  { 80000, "462bc6074a09bc8ad755c4bb22060f6bc981743e5148d219d348bdcbf0da6d27"},
  { 85000, "e466df7e0e37a213050a866cd43c4e7262858a61b6da0089518597f2e8591023"},
  { 90000, "0bb161976ae5c418bb8613a7d4c703dc247432b12923da8d373fa18f6730f8d4"}
    
  
};
}
